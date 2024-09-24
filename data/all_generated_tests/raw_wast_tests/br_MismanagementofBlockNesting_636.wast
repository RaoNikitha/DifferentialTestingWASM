;; 7. Design a nested `block` structure, where the innermost block includes a `br 3` to a non-existent label outside the outermost block. This verifies the implementation’s handling of invalid label targeting.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)