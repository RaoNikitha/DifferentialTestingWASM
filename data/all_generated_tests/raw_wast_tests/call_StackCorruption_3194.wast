;; Test Description 3: Define a nested function call where a function `A` calls `B`, which in turn calls `C`. All functions should take different numbers of arguments and return multiple values. This test checks if the stack is restored correctly after nested calls. Verify if either implementation causes stack corruption during nested function calls.

(assert_invalid
  (module
    (type $typeA (func (param i32) (result i32 i64)))
    (type $typeB (func (param i32 i64) (result f64)))
    (type $typeC (func (param f64)))
    (func $C (type $typeC)
      (param f64)
      (nop))
    (func $B (type $typeB)
      (param i32 i64)
      (result f64)
      (call $C (f64.const 42.0))
      (f64.const 3.14))
    (func $A (type $typeA)
      (param i32)
      (result i32 i64)
      (call $B (i32.const 10) (i64.const 20))
      (i32.const 1) (i64.const 2))
  )
  "type mismatch"
)