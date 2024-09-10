class AirportController extends AirportDatabaseConnection
{
    public static function CreateView($viewName, $data = null)
    {
        require_once "./Views/Airport/".$viewName.".php";
    }
}