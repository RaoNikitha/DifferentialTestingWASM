;; 3. **Test Description:**    A loop containing a `br` instruction that is supposed to jump to a `block` label outside the loop. Validate if the jump correctly exits the loop. Failure to implement causes the loop to run without terminating.

(assert_invalid
  (module
    (func $loop-br-to-block
      (block $exit
        (loop $l1
          (br $exit)
        )
      )
    )
  )
  "type mismatch"
)