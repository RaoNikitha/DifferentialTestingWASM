;; 4. **Test Description:**    Develop a complex function with nested blocks and loops, where `unreachable` is called inside a nested loop but the outer block contains `br_table` that selectively exits various levels.    *Constraint Checked:* Proper execution halting with nested loop and block termination due to `unreachable`.    *Mismanagement Focus:* Detects if the `br_table` propagates incorrect exit points on encountering `unreachable`.

(assert_invalid
  (module
    (func $complex-unreachable-nested (result i32)
      (block (result i32)
        (loop (result i32)
          (br_table 0 0 0)
          (block
            (loop
              (unreachable)
              (br 1)
            )
          )
        )
      )
    )
  )
  "unreachable executed"
)