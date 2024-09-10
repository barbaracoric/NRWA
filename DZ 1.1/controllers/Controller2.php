class AirportController extends Controller
{
    public function index()
    {
        $airports = Airport::getAll();
        $data['airports'] = $airports;
        self::CreateView('AirportIndexView', $data);
    }

    public function create()
    {
        $cities = City::getAll();
        $data['cities'] = $cities;
        self::CreateView('AirportAddView', $data);
    }

    public function store($request)
    {
        Airport::save($request['airport_id'], $request['airport_name'], $request['city_id']);
        $this->index();
    }

    public function edit($request)
    {
        $airport = Airport::findById($request['airport_id']);
        $data['airport'] = $airport;
        $cities = City::getAll();
        $data['cities'] = $cities;
        self::CreateView('AirportEditView', $data);
    }

    public function update($request)
    {
        Airport::update($request['airport_id'], $request['airport_name'], $request['city_id']);
        $this->index();
    }

    public function delete($request)
    {
        Airport::delete($request['airport_id']);
        $this->index();
    }
}