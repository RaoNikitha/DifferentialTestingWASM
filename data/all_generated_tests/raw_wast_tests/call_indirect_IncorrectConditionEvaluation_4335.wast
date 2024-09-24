;; Test the `call_indirect` instruction using a function with correct type but an incorrect `br_if` condition, verifying if the instruction incorrectly evaluates the condition leading to unwanted execution paths.

(assert_invalid
 (module
  (type (func (param i32) (result i32)))
  (func $correct_type (param i32) (result i32) (local.get 0))
  (table 1 funcref)
  (elem (i32.const 0) $correct_type)
  (func
   (param i32)
   (block (result i32)
    (call_indirect (type 0) (i32.const 0) (local.get 0))
    (br_if 0 (i32.const 1)))))
 "type mismatch"
)