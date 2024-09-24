;; Test 5: A `br_table` instruction that selects a target `loop` which requires an input of a different type than what the stack currently holds, causing a type inconsistency when the branch is taken.

(assert_invalid
  (module (func $test (result i32)
    (block
      (loop (param i32) (result i32)
        (i32.const 10)
        (i32.const 20)
        (br_table 0 (result i64)))))) 
  "type mismatch"
)