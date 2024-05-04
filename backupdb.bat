c:\xampp\mysql\bin\mysqldump.exe -uroot -pP@55w0rd bsd_api_dms_auth > C:\git\mono-dms-new\bsd_api_dms_auth.sql
c:\xampp\mysql\bin\mysqldump.exe -uroot -pP@55w0rd bsd_api_dms_member > C:\git\mono-dms-new\bsd_api_dms_member.sql
c:\xampp\mysql\bin\mysqldump.exe -uroot -pP@55w0rd bsd_api_dms_order > C:\git\mono-dms-new\bsd_api_dms_order.sql
c:\xampp\mysql\bin\mysqldump.exe -uroot -pP@55w0rd bsd_api_dms_product > C:\git\mono-dms-new\bsd_api_dms_product.sql
c:\xampp\mysql\bin\mysqldump.exe -uroot -pP@55w0rd bsd_api_dms_report > C:\git\mono-dms-new\bsd_api_dms_report.sql

c:\xampp\mysql\bin\mysql.exe -uroot -pP@55w0rd roxy_bsd_api_dms_auth < C:\git\mono-dms-new\bsd_api_dms_auth.sql
c:\xampp\mysql\bin\mysql.exe -uroot -pP@55w0rd roxy_bsd_api_dms_member < C:\git\mono-dms-new\bsd_api_dms_member.sql
c:\xampp\mysql\bin\mysql.exe -uroot -pP@55w0rd roxy_bsd_api_dms_order < C:\git\mono-dms-new\bsd_api_dms_order.sql
c:\xampp\mysql\bin\mysql.exe -uroot -pP@55w0rd roxy_bsd_api_dms_product < C:\git\mono-dms-new\bsd_api_dms_product.sql
c:\xampp\mysql\bin\mysql.exe -uroot -pP@55w0rd roxy_bsd_api_dms_report < C:\git\mono-dms-new\bsd_api_dms_report.sql