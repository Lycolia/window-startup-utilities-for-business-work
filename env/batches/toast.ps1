param (
    [String]$title   = "WSL Notice",
    [String]$message = "Command completed!",
    [String]$image   = "C:/env/batches/lycolia-180x180.png"
)

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastImageAndText04)
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($template.GetXml())
$toastTextElements = $xml.GetElementsByTagName("text")
$toastTextElements.Item(0).AppendChild($xml.CreateTextNode($title)) > $null
$toastTextElements.Item(0).AppendChild($xml.CreateTextNode($message)) > $null
$toastImageElements = $xml.GetElementsByTagName("image")
$toastImageElements.Item(0).SetAttribute("src", $image) > $null

$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$appId = "WSL Notification"
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId)

$notifier.Show($toast)
