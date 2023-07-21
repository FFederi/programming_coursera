all_except_option("ciao", ["hello","i","love"]) = NONE;
all_except_option("ciao", ["hello","ciao","love"]) = SOME ["hello", "love"];
