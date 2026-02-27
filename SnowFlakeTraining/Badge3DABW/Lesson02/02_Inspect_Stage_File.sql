Select $1, $2
FROM @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt
(file_format => smoothies.public.two_headerrow_pct_delim)
;