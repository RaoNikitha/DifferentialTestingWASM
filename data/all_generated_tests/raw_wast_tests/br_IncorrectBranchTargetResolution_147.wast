;; Construct nested blocks with varying `br` instructions, ensuring some `br` targets are valid while others are intentional misreferences, to verify if the branch target resolution correctly identifies and manages invalid targets.

(assert_invalid
  (module
    (func $nested-blocks-invalid-branch
      (block
        (block
          (block
            (block
              (br 10) 
            )
          )
        )
      )
    )
  )
  "unknown label"
)