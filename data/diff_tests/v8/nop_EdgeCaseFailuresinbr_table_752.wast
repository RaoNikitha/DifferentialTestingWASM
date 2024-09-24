;; 3. Create a sequence where a `nop` is placed just before a `br_table` instruction with an index that is one higher than the number of available targets, ensuring both implementations properly trap this out-of-bounds case.

(assert_invalid (module (func $test (result i32) (block $label (nop) (br_table $label) (i32.const 0)))) "index out of bounds")