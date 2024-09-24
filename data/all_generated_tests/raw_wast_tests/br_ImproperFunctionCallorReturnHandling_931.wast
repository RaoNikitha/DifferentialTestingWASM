;; <Test 2> Design a WebAssembly module where a function contains nested `if` and `loop` constructs. Within the `if` construct, place a `call_indirect` instruction that references a function via a table. Follow this by a `br` instruction that targets a label outside the `if` but inside the `loop`. Verify if the indirect call's return value is handled correctly after the branch.

(assert_invalid
  (module
    (table $T 1 funcref)
    (type $t (func))
    (func $f (type $t))
    (elem (i32.const 0) $f)
    (func $type-indirect-call-br
      (loop (result i32)
        (if (result i32)
          (call_indirect (type $t) (i32.const 0))
          (br 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)