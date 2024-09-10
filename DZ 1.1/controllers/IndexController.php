class AirportIndexController extends Controller
{
    public function index()
    {
        $airports = Airport::getAll();
        $data['airports'] = $airports;
        self::CreateView('AirportIndexView', $data);
    }
}