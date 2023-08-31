
func_services(){
  systemctl daemon-reload
  systemctl enable catalogue
  systemctl start catalogue
}