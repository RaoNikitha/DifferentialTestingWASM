;; Create a setup with nested loops, where the `call_indirect` instruction is placed at varying depths. Verify that both engines correctly manage the control flow and type checking under complex nested blocks when branching around the loops.

(assert_invalid
  (module
    (type $sig-empty (func))
    (type $sig-i32 (func (param i32) (result i32)))
    (func $callee (type $sig-i32) (param i32) (result i32)
      (i32.const 0))
    (table funcref (elem $callee))
    (func $nested-loops
      (loop $l1
        (loop $l2
          (call_indirect (type $sig-empty) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)