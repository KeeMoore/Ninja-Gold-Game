<!DOCTYPE html>
<html>
<head>
    <title>Debtors' Prison</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Debtors' Prison</h1>
    <p class="text-center">You have fallen too far into debt with ${gold} gold.</p>
    <form action="/process" method="POST">
        <input type="hidden" name="place" value="reset">
        <button type="submit" class="btn btn-danger">Reset</button>
    </form>
</div>
</body>
</html>

