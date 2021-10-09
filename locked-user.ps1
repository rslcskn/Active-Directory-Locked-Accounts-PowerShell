$tarih= (get-date).ToString("dd-MM-yy")

Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName, DistinguishedName | Export-CSV “C:\Temp\LockedOutUsers-$tarih.csv” -NoTypeInformation

$MailSender = " Gönderici Adı <Mail Adresi>" #Örn; Resul <resul@resul.info#
$Subject = "Mail Başlığı" #Örn; Resul <resul@resul.info#
$EmailBody = "Kilitli kullanıcılar ektedir."
$SMTPServer = 'SMTP Adresi' #SMTP adresini giriniz.#
$filepath = "C:\Temp\LockedOutUsers-$tarih.csv" 

If ((Get-Item $filepath).Length -gt 0kb) { 
Send-MailMessage -Encoding UTF8 -To "Alıcı Mail adresi" `
-From $MailSender -SmtpServer $SMTPServer `
-Subject $Subject `
-BodyAsHtml $EmailBody `
-Attachments $filepath `

}
else
{}
