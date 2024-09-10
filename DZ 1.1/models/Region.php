class City
{
    public $city_id;
    public $city_name;

    public function __construct($city_id, $city_name)
    {
        $this->city_id = $city_id;
        $this->city_name = $city_name;
    }

    public static function getAll()
    {
        $list = [];
        $req = AirportDatabaseConnection::query("SELECT * FROM cities");
        foreach ($req as $city) {
            $list[] = new City($city['city_id'], $city['city_name']);
        }
        return $list;
    }

    public static function findById($city_id)
    {
        $req = AirportDatabaseConnection::query("SELECT * FROM cities WHERE city_id = '$city_id'");
        $city = $req[0];
        return new City($city['city_id'], $city['city_name']);
    }

    public static function save($city_id, $city_name)
    {
        return AirportDatabaseConnection::query("INSERT INTO cities (city_id, city_name) VALUES ('$city_id', '$city_name')");
    }

    public static function update($city_id, $city_name)
    {
        return AirportDatabaseConnection::query("UPDATE cities SET city_name = '$city_name' WHERE city_id = '$city_id'");
    }

    public static function delete($city_id)
    {
        return AirportDatabaseConnection::query("DELETE FROM cities WHERE city_id = '$city_id'");
    }
}