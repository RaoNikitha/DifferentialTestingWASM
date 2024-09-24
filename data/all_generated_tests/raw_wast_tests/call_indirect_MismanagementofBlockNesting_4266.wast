;; 5. Implement a nested loop with a `call_indirect` located inside a block, where the target function’s type does not match exactly the expected type. Check if the implementations trap appropriately considering the depth of the nesting.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32 i32) (result i32)))
    (table funcref (elem $f))
    (func $nested-loop
      (loop
        (block
          (call_indirect (type $sig) (i32.const 0) (i32.const 1) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)