public class BinaryInsertSort {

    public static void BinaryInsertSort(int[] nums){

        for(int i=0;i<nums.length;i++)
            BinaryInsert(nums,i);

    }

    private static void BinaryInsert(int[] nums,int i){

        int left=0;
        int right=i-1;
        int temp=nums[i];

        //二分查找找到插入位置
        while(left<=right){

            int mid=(left+right)/2;

            if(temp<nums[mid])
                right=mid-1;
            else
                left=mid+1;

        }

        for(int k=i-1;k>=left;k--){
            nums[k+1]=nums[k];
        }

        nums[left]=temp;
    }


    public static void main(String[] args) {

        int[] nums={28,13,72,85,39,41,6,20};
        BinaryInsertSort(nums);

        for(int i=0;i<nums.length;i++)
            System.out.print(nums[i]+" ");
    }
}
