;; 1. Place the `unreachable` instruction inside a nested loop and check if the loop termination is handled correctly. Confirm that no instructions beyond `unreachable` in the inner loop are executed.    - **Constraint:** Ensure consistent loop termination and handling of `unreachable` within nested control structures.    - **CFG Check:** Validate that loops are exited correctly when encountering `unreachable`.

(assert_invalid 
  (module 
    (func $nested-loop-unreachable 
      (block 
        (loop 
          (br 1) 
          (unreachable)
          (i32.const 1)
        )
      ) 
    )
  ) 
  "type mismatch"
)