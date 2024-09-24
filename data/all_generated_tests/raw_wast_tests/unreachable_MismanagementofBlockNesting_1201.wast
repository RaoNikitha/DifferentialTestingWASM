;; 2. **Test Description:**    A function with `if` statements nested within loops, each containing `unreachable` instructions, followed by multiple `br` instructions to various depth levels.    - **Constraint Checked:** Checks if `unreachable` within nested `if` and `loop` constructs generate proper traps and whether subsequent `br` uses correct depth handling.    - **Relation to Mismanagement of Block Nesting:** Ensures the proper nesting context is managed, preventing incorrect block or loop exits post `unreachable` traps.

(assert_invalid
  (module (func $nested-unreachable-br
    (block
      (loop
        (if (i32.const 1)
          (then (unreachable))
          (else (br 2))
        )
        (br 1)
      )
    )
  ))
  "type mismatch"
)