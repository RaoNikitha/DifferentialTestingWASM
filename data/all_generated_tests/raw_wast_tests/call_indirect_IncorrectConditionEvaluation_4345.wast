;; 4. Test Description 4: Define multiple function types and a table populated correctly. Use `call_indirect` where the operand index matches, but set up a `br_if` condition with an erroneous i32 operand (e.g., a negative number) to check for errors.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (type 0) (param i32) (result i32) (i32.const 0))
    (func $func2 (type 1) (param i32)
      (block (result i32)
        (call_indirect (type 0) (local.get 0) (br_if 0 (i32.const -1)))
      )
    )
  )
  "type mismatch"
)