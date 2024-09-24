;; Write a function using nested `block` structures, inserting `br` instructions that branch to each possible nested level. Verify if each branch correctly resumes at the intended position and stack state. Testing for: Correct CFG paths and operand stack states in multi-level branching scenarios to ensure no invalid paths or operand mismatches.

(assert_invalid
  (module
    (func $nested-br
      (block $l1
        (block $l2
          (block $l3
            (br 3)  ;; Branch to an unknown label that exceeds nesting depth
          )
        )
      )
    )
  )
  "unknown label"
)