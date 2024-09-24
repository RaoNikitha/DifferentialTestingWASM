;; <Test 8> Create a WebAssembly module with a function having multiple `if-else` branches and a `loop`. Within an `if`, place a `call_indirect` targeting different types from a table. Immediately follow with a `br` instruction to the loop start. Verify if the function calls and context are maintained correctly when looping back.

(assert_invalid
  (module
    (func $f (param i32) (result i32) (local.get 0))
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func))
    (table funcref (elem $f))
    (func $complex-loop
      (loop $outer (result i32)
        (if (i32.const 1)
          (then
            (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
            (br $outer)
          )
          (else
            (call_indirect (type $sig2) (i32.const 0))
            (br $outer)
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)