<?php 

function getDatabase(): mysqli 
{
    return new mysqli('localhost', 'root', '', 'immo');
}