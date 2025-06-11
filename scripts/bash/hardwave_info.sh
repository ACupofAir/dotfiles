o │ %-30s │\n" "$1" "$2"
}

print_separator() {
    echo "├──────────────────────────┼────────────────────────────────┤"
}

# ─────────────────────────────────────────────
echo "┌──────────────────────────┬────────────────────────────────┐"
echo "│           CPU Info       │                                │"
print_separator

cpu_cores=$(lscpu | grep "^Core(s) per socket:" | awk '{print $4}')
cpu_threads=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
cpu_freq=$(lscpu | grep "CPU max MHz" | awk '{print $4}')
[ -z "$cpu_freq" ] && cpu_freq="Unknown"

print_row "Physical CPU cores" "$cpu_cores"
print_row "Logical CPU threads" "$cpu_threads"
print_row "Max CPU frequency" "$cpu_freq MHz"

# ─────────────────────────────────────────────
echo "├──────────────────────────┬────────────────────────────────┤"
echo "│         Memory Info      │                                │"
print_separator

mem_total=$(free -h | grep Mem | awk '{print $2}')
print_row "Total memory" "$mem_total"

if command -v dmidecode &>/dev/null; then
    mem_freq=$(sudo dmidecode -t memory | grep "Speed" | grep -v "Configured" | sort | uniq | awk '{print $2" "$3}' | paste -sd ", " -)
    print_row "Memory frequency" "$mem_freq"
else
    print_row "Memory frequency" "dmidecode not installed"
fi

# ─────────────────────────────────────────────
echo "├──────────────────────────┬────────────────────────────────┤"
echo "│         Disk Info        │                                │"
print_separator

# Get total capacity of all physical disks in bytes, then convert
total_bytes=$(lsblk -b -dn -o SIZE,TYPE | awk '$2=="disk"{sum+=$1} END{print sum}')
total_gb=$(awk "BEGIN {printf \"%.1f GB\", $total_bytes/1024/1024/1024}")
print_row "Total disk capacity" "$total_gb"

# Test read speed on root disk
root_device=$(findmnt -n -o SOURCE /)
disk_device=$(lsblk -no pkname "$root_device" | head -n1)
disk_device="/dev/$disk_device"

if command -v hdparm &>/dev/null; then
    speed_output=$(sudo hdparm -Tt "$disk_device" 2>/dev/null)
    read_speed=$(echo "$speed_output" | grep "buffered disk reads" | awk -F '=' '{print $2}' | xargs)
    print_row "$disk_device read speed" "$read_speed"
else
    print_row "Disk speed test" "hdparm not installed"
fi

# ─────────────────────────────────────────────
echo "└──────────────────────────┴────────────────────────────────┘"
