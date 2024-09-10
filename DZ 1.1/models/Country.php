class Airport
{
    public $airport_id;
    public $airport_name;
    public $city_id;
    public $city_name;

    public function __construct($airport_id, $airport_name, $city_id, $city_name)
    {
        $this->airport_id = $airport_id;
        $this->airport_name = $airport_name;
        $this->city_id = $city_id;
        $this->city_name = $city_name;
    }

    public static function getAll()
    {
        $list = [];
        $req = AirportDatabaseConnection::query("SELECT a.*, c.city_name FROM airports a JOIN cities c ON a.city_id = c.city_id");
        foreach ($req as $airport) {
            $list[] = new Airport($airport['airport_id'], $airport['airport_name'], $airport['city_id'], $airport['city_name']);
        }
        return $list;
    }

    public static function findById($airport_id)
    {
        $req = AirportDatabaseConnection::query("SELECT a.*, c.city_name FROM airports a JOIN cities c ON a.city_id = c.city_id WHERE a.airport_id = '$airport_id'");
        $airport = $req[0];
        return new Airport($airport['airport_id'], $airport['airport_name'], $airport['city_id'], $airport['city_name']);
    }

    public static function save($airport_id, $airport_name, $city_id)
    {
        return AirportDatabaseConnection::query("INSERT INTO airports (airport_id, airport_name, city_id) VALUES ('$airport_id', '$airport_name', $city_id)");
    }

    public static function update($airport_id, $airport_name, $city_id)
    {
        return AirportDatabaseConnection::query("UPDATE airports SET airport_name = '$airport_name', city_id = $city_id WHERE airport_id = '$airport_id'");
    }

    public static function delete($airport_id)
    {
        return AirportDatabaseConnection::query("DELETE FROM airports WHERE airport_id = '$airport_id'");
    }
}