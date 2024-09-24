;; 5. Create a WebAssembly module with a `block` wrapping a `loop` that contains an `if` condition. Use `br` to jump out of the loop in case the condition is not met. Place an `unreachable` instruction right after the `if` in the loop, ensuring that the branch correctly avoids execution of the unreachable code.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (if (i32.eqz (i32.const 0))
            (then (br 1))
          )
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)