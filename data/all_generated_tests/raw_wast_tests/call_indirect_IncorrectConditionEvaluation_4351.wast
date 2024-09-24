;; 10. Test Description 10: Construct a `call_indirect` with a valid function in a valid table but set a `br_if` condition with an operand outside the operational range (e.g., intentionally large value) to judge its boundary-checking and error handling.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $boundary-check (block (br_if 0 (i32.const 10000)) (call_indirect (type 0) (i32.const 0) (i32.const 42))))
  )
  "index out of bounds"
)