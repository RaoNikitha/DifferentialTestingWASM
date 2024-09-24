;; 2. Test Description: Place `nop` within a loop that conditionally breaks out based on an input. Ensure that incorrect validation of `nop` does not prevent reaching an `unreachable` inside the loop if the loop continues.

(assert_invalid
  (module
    (func (param i32)
      (local i32)
      (block
        (loop
          (br_if 1
            (i32.eqz (get_local 0))
          )
          (nop)
          (br 0)
        )
        (unreachable)
      )
    )
  )
  "unreachable executed"
)