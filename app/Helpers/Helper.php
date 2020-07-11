<?php
class Helper
{
    public static function converToTz($time="")
    {   
        $date = new DateTime($time);
        $date->setTimezone(new DateTimeZone(config('app.timezone')));
        $time= $date->format('d M Y h:i A');
        return $time;
    }
}