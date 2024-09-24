;; 4. **Test Description:**    A sequence of nested `block`, `loop`, and `if` instructions, each including `unreachable`, followed by normal instructions. The final block includes a `br` that should normally exit the outermost block.    - **Constraint Checked:** Ensures that `unreachable` interrupts the sequence immediately and no following instructions execute or affect control flow.    - **Relation to Mismanagement of Block Nesting:** Assures that trap effect from `unreachable` propagates correctly through nested constructs, stopping block mis-exits.

(assert_invalid
  (module (func $test_nested_unreachable_blocks
    (block
      (loop
        (if (i32.const 1)
          (then
            (unreachable)
          )
        )
      )
      (i32.const 0)
      (br 0)
    )
  ))
  "type mismatch"
)