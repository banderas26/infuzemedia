<?php
img::show();
$cViews = new views();
$cViews->init();

class views
{
    private $user_agent;
    private $ip;
    private $url;

    public function __construct()
    {
        $this->onPrepare();
    }

    protected function onPrepare()
    {
        $this->user_agent = $_SERVER['HTTP_USER_AGENT'];
        $this->ip = $_SERVER['REMOTE_ADDR'];
        $this->url = $_SERVER['HTTP_REFERER'];
    }

    public function init()
    {
        $user = $this->getUser();
        if (!$user) {
            $this->addUser();
        } else {
            $this->updUser($user);
        }
    }

    private function addUser()
    {
        $db = new db();
        $mysqli = $db->mysqli;
        $sql = "INSERT INTO `user` 
                    SET 
                    view_date = NOW(),
                    views_count = 1,
                    ip = '" . $this->ip . "',
                    user_agent = '" . $mysqli->real_escape_string($this->user_agent) . "',
                    url = '" . $mysqli->real_escape_string($this->url) . "'
                ";
        $db->query($sql);
    }

    private function updUser($arUser)
    {
        $db = new db();
        $mysqli = $db->mysqli;

        $sql = "
            UPDATE 
                `user`
            SET
                views_count = '" . ($arUser['views_count'] + 1) . "'
            WHERE
                ip = '" . $this->ip . "'
                AND user_agent = '" . $mysqli->real_escape_string($this->user_agent) . "'
                AND url = '" . $mysqli->real_escape_string($this->url) . "'
        ";
        $db->query($sql);
    }

    private function getUser()
    {
        $db = new db();
        $mysqli = $db->mysqli;

        $sql = "
            SELECT 
                id,user_agent,views_count,url
            FROM user
            WHERE
                ip = '" . $this->ip . "'
                AND user_agent = '" . $mysqli->real_escape_string($this->user_agent) . "'
                AND url = '" . $mysqli->real_escape_string($this->url) . "'
            LIMIT 1
        ";
        $rsItem = $db->query($sql);
        if ($rsItem->num_rows > 0)
            return $rsItem->fetch_assoc();

        return false;
    }
}

class db
{
    public $mysqli;

    public function __construct()
    {
        $this->connect();
    }

    protected function connect()
    {
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        $mysqli = new mysqli("mysql", "root", "secret", "infuzemedia");
        $this->mysqli = $mysqli;
    }

    public function query($query)
    {
        return $this->mysqli->query($query);
    }
}

class img
{
    public static function show()
    {
        // Устанавливаем тип содержимого в заголовок, в данном случае image/jpeg
//        header('Content-Type: image/jpg');
        echo file_get_contents('https://oir.mobi/uploads/posts/2021-06/1623718525_25-oir_mobi-p-oktyabr-listopad-priroda-krasivo-foto-26.jpg');
    }
}