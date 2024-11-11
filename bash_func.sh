proxy_on() {
  export http_proxy="http://xxx:xxx"
  export https_proxy="http://xxx:xxx"
  echo "proxy on"
}

proxy_off() {
  unset http_proxy
  unset https_proxy
  echo "proxy off"
}
