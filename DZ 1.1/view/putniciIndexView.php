<h1>Putnici</h1>
<a href="passengers_create" class="button-link">Novi Putnik</a>

<?php
?>

<div style="overflow-x:auto;">
    <table class="data-table">
        <tr>
            <th>#</th>
            <th>Ime</th>
            <th>Prezime</th>
            <th>Broj putovnice</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <?php foreach ($data['passengers'] as $row): ?>
            <tr>
                <td><?php echo $row->passenger_id ?></td>
                <td><?php echo $row->first_name ?></td>
                <td><?php echo $row->last_name ?></td>
                <td><?php echo $row->passport_number ?></td>
                <td><a href="passengers_edit?passenger_id=<?php echo $row->passenger_id ?>" class="edit-btn"> Edit</a>
                </td>
                <td>
                    <form action="passengers_delete" method="post">
                        <input type="hidden" name="_method" value="DELETE">
                        <input type="hidden" name="passenger_id" value="<?= $row->passenger_id ?>">
                        <input type="submit" value="Delete" class="delete-btn">
                    </form>
                </td>
            </tr>
        <?php endforeach ?>
    </table>
</div>