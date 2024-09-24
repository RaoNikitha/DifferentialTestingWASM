;; 7. Implement a `block` within another `block` with a `br` targeting the outer block when inside the inner block. This examines whether `br` can correctly reference and jump to the appropriate label in a nested `block` structure, checking **relative label lookup correctness**.

(assert_invalid
  (module
    (func $nested-br-label-indexing
      (block
        (block
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)