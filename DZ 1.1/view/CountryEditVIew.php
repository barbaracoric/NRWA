<div id="dataModal">
    <h4>Uredi aerodrom</h4>
    <div class="divider surface-0 mv10"></div>
    <form id="form" method="post" action="airports_update">
        <input type="hidden" name="_method" value="PUT">
        <div class="input-row">
            <label for="airport_id">ID</label>
            <input id="airport_id" name="airport_id" type="text" value="<?= $data['airport']->airport_id ?>" readonly />
        </div>
        <div class="input-row">
            <label for="airport_name">Naziv</label>
            <input id="airport_name" name="airport_name" type="text" value="<?= $data['airport']->airport_name ?>" />
        </div>
        <div class="input-row">
            <label for="city_id">Grad</label>
                <select id="city_id" name="city_id">
                    <option value="-1" selected disabled>Odaberite Grad</option>
                    <?php foreach ($data['cities'] as $city): ?>
                    <option value="<?=$city->city_id?>" <?= $city->city_id == $data['airport']->city_id ? 'selected' : '' ?>><?=$city->city_name?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        <div class="divider surface-0 mv5"></div>
        <div class="button-row">
            <button type="submit" name="Submit">Uredi</button>
        </div>
    </form>
</div>