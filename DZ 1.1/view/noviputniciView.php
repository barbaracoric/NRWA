<div id="dataModal">
    <h4>Novi putnici</h4>
    <div class="divider surface-0 mv10"></div>
    <form id="form" method="post" action="passengers">
        <div class="input-row">
            <label for="passenger_id">ID</label>
            <input id="passenger_id" name="passenger_id" type="text" placeholder="Unesite ID putnika" />
        </div>
        <div class="input-row">
            <label for="first_name">Ime</label>
            <input id="first_name" name="first_name" type="text" placeholder="Unesite ime putnika" />
        </div>
        <div class="input-row">
            <label for="last_name">Prezime</label>
            <input id="last_name" name="last_name" type="text" placeholder="Unesite prezime putnika" />
        </div>
        <div class="input-row">
            <label for="passport_number">Broj putovnice</label>
            <input id="passport_number" name="passport_number" type="text" placeholder="Unesite broj putovnice" />
        </div>
        <div class="divider surface-0 mv5"></div>
        <div class="button-row">
            <button type="submit" name="Submit">Dodaj</button>
        </div>
    </form>
</div>