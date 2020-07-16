<?php
namespace App\Helpers;
class Helper
{
    public static function converToTz($time="")
    {
        $date = new DateTime($time);
        $date->setTimezone(new DateTimeZone(config('app.timezone')));
        $time= $date->format('d M Y h:i A');
        return $time;
    }

    public static function sendSMS($mobnos,$msg)
    {
        $ch = curl_init('https://www.txtguru.in/imobile/api.php?');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, "username=nulock.co.in&password=90959453&source=CHARGE&dmobile=$mobnos&message=$msg");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        return $data = curl_exec($ch);
    }
}
