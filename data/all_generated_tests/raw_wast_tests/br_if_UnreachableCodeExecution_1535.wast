;; 6. **Test Description:** Develop a multifaceted `block` containing nested `if-else` statements. Use `br_if` for conditional branching out of the nested structures. Place `unreachable` instructions outside the main block to validate that relative label lookups don’t cause control to exit improperly.

(assert_invalid
  (module
    (func $nested_if_else 
      (block 
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (i32.const 1)
        (if (i32.const 1) 
          (then (br_if 0 (i32.const 1)))
          (else (br_if 1 (i32.const 1)))
        )
        (i32.const 1)
        (unreachable)
      )
    )
  )
  "unknown label"
)