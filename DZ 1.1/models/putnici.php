class Flight
{
    public $flight_id;
    public $flight_number;
    public $departure_time;
    public $arrival_time;

    public function __construct($flight_id, $flight_number, $departure_time, $arrival_time)
    {
        $this->flight_id = $flight_id;
        $this->flight_number = $flight_number;
        $this->departure_time = $departure_time;
        $this->arrival_time = $arrival_time;
    }

    public static function getAll()
    {
        $list = [];
        $req = AirportDatabaseConnection::query("SELECT * FROM flights");
        foreach ($req as $flight) {
            $list[] = new Flight($flight['flight_id'], $flight['flight_number'], $flight['departure_time'], $flight['arrival_time']);
        }
        return $list;
    }

    public static function findById($flight_id)
    {
        $req = AirportDatabaseConnection::query("SELECT * FROM flights WHERE flight_id = '$flight_id'");
        $flight = $req[0];
        return new Flight($flight['flight_id'], $flight['flight_number'], $flight['departure_time'], $flight['arrival_time']);
    }

    public static function save($flight_id, $flight_number, $departure_time, $arrival_time)
    {
        return AirportDatabaseConnection::query("INSERT INTO flights (flight_id, flight_number, departure_time, arrival_time) VALUES ('$flight_id', '$flight_number', '$departure_time', '$arrival_time')");
    }

    public static function update($flight_id, $flight_number, $departure_time, $arrival_time)
    {
        return AirportDatabaseConnection::query("UPDATE flights SET flight_number = '$flight_number', departure_time = '$departure_time', arrival_time = '$arrival_time' WHERE flight_id = '$flight_id'");
    }

    public static function delete($flight_id)
    {
        return AirportDatabaseConnection::query("DELETE FROM flights WHERE flight_id = '$flight_id'");
    }
}