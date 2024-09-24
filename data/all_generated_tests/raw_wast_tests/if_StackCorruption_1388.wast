;; 9. Test an `if` instruction inside a `loop` block, with further nested `if` instructions inside that loop. Test with complex control flows to induce potential mismatches in stack height and types handling across recursive and explicit state management implementations.

(assert_invalid
  (module
    (func $test
      (loop (result i32)
        (i32.const 1)
        (if (result i32)
          (i32.const 2)
          (then
            (i32.add)
            (if (result i32)
              (i32.const 3)
              (then (i32.sub) (br 1))
              (else (i32.const 4))
            )
          )
          (else (i32.const 5))
        )
      )
    )
  )
  "type mismatch"
)