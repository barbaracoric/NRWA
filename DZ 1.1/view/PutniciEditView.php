div id="dataModal">
    <h4>Uredi putnika</h4>
    <div class="divider surface-0 mv10"></div>
    <form id="form" method="post" action="passengers_update">
        <input type="hidden" name="_method" value="PUT">
        <div class="input-row">
            <label for="passenger_id">ID</label>
            <input id="passenger_id" name="passenger_id" type="text" value="<?= $data['passenger']->passenger_id ?>" readonly />
        </div>
        <div class="input-row">
            <label for="first_name">Ime</label>
            <input id="first_name" name="first_name" type="text" value="<?= $data['passenger']->first_name ?>" />
        </div>
        <div class="input-row">
            <label for="last_name">Prezime</label>
            <input id="last_name" name="last_name" type="text" value="<?= $data['passenger']->last_name ?>" />
        </div>
        <div class="input-row">
            <label for="passport_number">Broj putovnice</label>
            <input id="passport_number" name="passport_number" type="text" value="<?= $data['passenger']->passport_number ?>" />
        </div>
        <div class="divider surface-0 mv5"></div>
        <div class="button-row">
            <button type="submit" name="Submit">Uredi</button>
        </div>
    </form>
</div>