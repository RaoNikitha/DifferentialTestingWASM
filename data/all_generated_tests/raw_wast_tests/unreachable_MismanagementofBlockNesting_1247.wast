;; 8. Place an `unreachable` inside the innermost block of multilayered blocks and have a `br` pointing to the outermost block. This test checks if the control flow skips intermediate levels and reaches the correct block level after trapping.

(assert_invalid
  (module (func $multilayered-blocks-with-unreachable
    (block
      (block
        (block
          (unreachable)
          (br 2)
        )
      )
    )
  ))
  "type mismatch"
)