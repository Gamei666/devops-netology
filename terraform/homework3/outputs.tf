output "default" {
   value = [
    {
    count = length(yandex_compute_instance.db)
   },
   {
    "name" = "${["yandex_compute_instance"]["db"][count.index].name}"
   }
   ]
   
}
