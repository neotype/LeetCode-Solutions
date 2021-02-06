/*
 * @lc app=leetcode id=124 lang=cpp
 *
 * [124] Binary Tree Maximum Path Sum
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */

class Solution {
public:
    int result = INT_MIN;

    int maxPathSum(TreeNode* root) {
        oneSideMax(root);
        return this->result;
    }
private:
    int oneSideMax(TreeNode* root) {
        if (root == nullptr) {
            return 0;
        }

        int leftSideMax = max(0, oneSideMax(root->left));
        int rightSideMax = max(0, oneSideMax(root->right));

        this->result = max(this->result, leftSideMax + rightSideMax + root->val);
        return max(leftSideMax, rightSideMax) + root->val;
    }
};
// @lc code=end

