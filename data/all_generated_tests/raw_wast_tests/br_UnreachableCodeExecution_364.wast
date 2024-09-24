;; 5. **Test Description:** Create deeply nested `block` and `loop` structures with `br` instructions using increasing label indices. Place `unreachable` instructions at several points to trap incorrect label indexing.     - **Constraint Checked:** Correct handling of relative label indexing in deeply nested structures.     - **Relation to Unreachable Code Execution:** Ensures label indices are interpreted correctly to avoid erroneous execution reaching `unreachable`.

(assert_invalid
  (module
    (func $deep-nested-blocks
      (block (block (block 
        (block 
          (br 3) 
          (unreachable)
        ) 
        (unreachable)
      ) 
      (unreachable)
    ) 
    (unreachable)
  ))
  "unknown label"
)