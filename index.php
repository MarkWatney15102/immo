<?php 
    require_once('lib/database.php');
    $database = getDatabase();


    if (isset($_POST['createCity'])) {
        if (!empty($_POST['zipCode']) && !empty($_POST['name'])) {
            $sql = "INSERT INTO ort (`zipCode`, `name`) VALUES ('{$_POST['zipCode']}', '{$_POST['name']}')";
            $database->query($sql);
            header("Location: index.php");
        }
    }

    if (isset($_POST['createStreet'])) {
        if (!empty($_POST['name']) && !empty($_POST['ort'])) {
            $sql = "INSERT INTO strasse (`name`, `ortZipCode`) VALUES ('{$_POST['name']}', '{$_POST['ort']}')";
            $database->query($sql);
            header("Location: index.php");
        }
    }

    if (isset($_POST['createPerson'])) {
        if (!empty($_POST['firstname']) && !empty($_POST['lastname']) && !empty($_POST['hausNr']) && !empty($_POST['street'])) {
            $sql = "INSERT INTO person (`vorname`, `nachname`, `hausNr`, `strasseId`) VALUES ('{$_POST['firstname']}', '{$_POST['lastname']}', '{$_POST['hausNr']}', '{$_POST['street']}')";
            $database->query($sql);
            header("Location: index.php");
        } 
    }

    if (isset($_POST['createWohnobjekt'])) {
        if (!empty($_POST['hausNrWohnobjekt']) && !empty($_POST['streetWohnobjekt']) && !empty($_POST['desc'])) {
            $sql = "INSERT INTO `wohnobjekt` (`hausNr`, `strasseId`, `bezeichnung`) VALUES ('{$_POST['hausNrWohnobjekt']}', '{$_POST['streetWohnobjekt']}', '{$_POST['desc']}');";
            $database->query($sql);
            header("Location: index.php");
        }
    }

    if (isset($_POST['createWohnung'])) {
        if (!empty($_POST['etage']) && !empty($_POST['nummer']) && !empty($_POST['wohnobjekt'])) {
            $sql = "INSERT INTO `wohnung` (`etage`, `nummer`, `wohnobjektId`) VALUES ('{$_POST['etage']}', '{$_POST['nummer']}', '{$_POST['wohnobjekt']}');";
            $database->query($sql);
            header("Location: index.php");
        }
    }

    if (isset($_POST['assignPersonWohnobjekt'])) {
        if (!empty($_POST['wohnobjektPerson']) && !empty($_POST['personPerson'])) {
            $sql = "INSERT INTO `wohnung_person` (`wohnungId`, `personId`) VALUES ('{$_POST['etage']}', '{$_POST['nummer']}');";
            $database->query($sql);
            header("Location: index.php");
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>Immo Project</title>
</head>
<body>
   <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4">
               <h2>Ort erstellen</h2>
               <form method="post">
                    <label>Postleitzahl</label>
                    <input type="number" name="zipCode" id="zipCode" class="form-control">

                    <label>Name</label>
                    <input type="text" name="name" id="name" class="form-control">

                    <input type="submit" class="btn btn-block btn-outline-success" name="createCity" value="Ort erstellen">
               </form>
           </div>
            <div class="col-lg-4">
               <h2>Strasse erstellen</h2>
               <form method="post">
                    <label>Name</label>
                    <input type="text" name="name" id="name" class="form-control">
                   
                    <label>Ort</label>
                    <select name="ort" class="form-control">
                        <?php 
                            $sql = "SELECT * FROM ort";
                            $result = $database->query($sql);

                            foreach ($result as $option) {
                                echo '<option value="' . $option['zipCode'] . '">' . $option['name'] . '</option>';
                            }
                        ?>
                    </select>
                    
                    <input type="submit" class="btn btn-block btn-outline-success" name="createStreet" value="Strasse erstellen">
               </form>
           </div>
           <div class="col-lg-4">
               <h2>Person erstellen</h2>
               <form method="post">
                    <label>Vorname</label>
                    <input type="text" name="firstname" id="firstname" class="form-control">

                    <label>Nachname</label>
                    <input type="text" name="lastname" id="lastname" class="form-control">

                    <label>Haus Nummer</label>
                    <input type="number" name="hausNr" id="hausNr" class="form-control">
                   
                    <label>Strasse</label>
                    <select name="street" class="form-control">
                        <?php 
                            $sql = "SELECT * FROM strasse";
                            $result = $database->query($sql);

                            foreach ($result as $option) {
                                echo '<option value="' . $option['id'] . '">' . $option['name'] . '</option>';
                            }
                        ?>
                    </select>

                    <input type="submit" class="btn btn-block btn-outline-success" name="createPerson" value="Person erstellen">
               </form>
           </div>
       </div>
       <br>
       <div class="row">
            <div class="col-lg-4">
                <h2>Wohnobjekt erstellen</h2>
                <form method="post">
                    <label>Haus Nummer</label>
                    <input type="number" name="hausNrWohnobjekt" id="hausNrWohnobjekt" class="form-control">

                    <label>Bezeichnung</label>
                    <input type="text" name="desc" id="desc" class="form-control">

                    <label>Strasse</label>
                    <select name="streetWohnobjekt" class="form-control">
                        <?php 
                            $sql = "SELECT * FROM strasse";
                            $result = $database->query($sql);

                            foreach ($result as $option) {
                                echo '<option value="' . $option['id'] . '">' . $option['name'] . '</option>';
                            }
                        ?>
                    </select>
                    
                    <input type="submit" class="btn btn-block btn-outline-success" name="createWohnobjekt" value="Wohnobjekt erstellen">
               </form>
           </div>
           <div class="col-lg-4">
                <h2>Wohnung erstellen</h2>
                <form method="post">
                    <label>Etage</label>
                    <input type="number" name="etage" id="etage" class="form-control">

                    <label>Nummer</label>
                    <input type="number" name="nummer" id="nummer" class="form-control">

                    <label>Wohnungobjekt</label>
                    <select name="wohnobjekt" class="form-control">
                        <?php 
                            $sql = "SELECT * FROM wohnobjekt";
                            $result = $database->query($sql);

                            foreach ($result as $option) {
                                echo '<option value="' . $option['ID'] . '">' . $option['bezeichnung'] . '</option>';
                            }
                        ?>
                    </select>
                    
                    <input type="submit" class="btn btn-block btn-outline-success" name="createWohnung" value="Wohnung erstellen">
               </form>
           </div>
           <div class="col-lg-4">
                <h2>Wohnung zu Person zuweisen</h2>
                <form method="post">
                    <label>Wohnungobjekt</label>
                    <select name="wohnobjektPerson" class="form-control">
                        <?php 
                            $sql = "SELECT * FROM wohnobjekt";
                            $result = $database->query($sql);

                            foreach ($result as $option) {
                                echo '<option value="' . $option['ID'] . '">' . $option['bezeichnung'] . '</option>';
                            }
                        ?>
                    </select>

                    <label>Person</label>
                    <select name="personPerson" class="form-control">
                        <?php 
                            $sql = "SELECT * FROM person";
                            $result = $database->query($sql);

                            foreach ($result as $option) {
                                echo '<option value="' . $option['ID'] . '">' . $option['vorname'] . ' ' . $option['nachname'] . '</option>';
                            }
                        ?>
                    </select>
                    
                    <input type="submit" class="btn btn-block btn-outline-success" name="assignPersonWohnobjekt" value="Wohnung erstellen">
               </form>
           </div>
       </div>
   </div> 
</body>
</html>