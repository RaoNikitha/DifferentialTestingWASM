;; 10. Construct a test where an indirect call in a chain of module calls dynamically changes the table content, ensuring that `call_indirect` maintains correct control flow and type checking throughout the sequence.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem 0))
    (func $change_table (param i32) (result i32)
      (table.set 0 (i32.const 0) (ref.func $f1))
      (i32.const 0)
    )
    (func $f1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $main (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0) (call $change_table (local.get 0)))
    )
  )
  "type mismatch"
)