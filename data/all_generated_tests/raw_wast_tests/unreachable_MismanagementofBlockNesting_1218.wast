;; 9. Having `unreachable` within a `block` inside a `loop` inside yet another `block`, followed by `br_if` that conditionally breaks nested layers. This checks if the `unreachable` causes all subsequent `br_if` to behave correctly in exiting structures.

(assert_invalid
  (module 
    (func $test 
      (block 
        (loop 
          (block 
            (unreachable) 
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)