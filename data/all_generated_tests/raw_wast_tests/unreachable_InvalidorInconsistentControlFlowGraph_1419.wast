;; 10. **Test Description:** Use `unreachable` inside a loop that contains instructions modifying the control flow stack, such as `block` and `end`. This checks if the CFG manages complex stack states and control paths correctly when an unconditional trap is encountered.    - **Constraint:** Trap should consistently interrupt complex control paths.    - **Relation to CFG:** Ensures CFG's robustness and correctness when handling complex control stack states and trapping.

(assert_invalid
  (module
    (func $complex-control-unreachable
      (block
        (loop
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)