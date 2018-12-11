import com.sun.scenario.effect.Merge;

public class MergeSort {


    public static void mergeSort(int[] a){

        int[] temp=new int[a.length];
        mergeSort(a,0,a.length-1,temp);
    }

    private static void mergeSort(int[] a,int left,int right,int[] temp){

        if(left>=right)
            return;

        int mid=(left+right)/2;
        mergeSort(a,left,mid,temp);
        mergeSort(a,mid+1,right,temp);
        merge(a,left,mid,right,temp);

    }

    private static void merge(int[] a,int left,int mid,int right,int[] temp){

        int i=left;
        int j=mid+1;
        int t=0;

        while(i<=mid&&j<=right) {

            if(a[i]<=a[j]) {
                temp[t++] = a[i++];
            }else {
                temp[t++] = a[j++];
            }

        }

        while(i<=mid)
            temp[t++]=a[i++];

        while(j<=right)
            temp[t++]=a[j++];

        t=0;
        int k=left;
        while(k<=right)
            a[k++]=temp[t++];


    }

    public static void main(String[] args) {

        int[] nums={28,13,72,85,39,41,6,20};
        mergeSort(nums);

        for(int i=0;i<nums.length;i++)
            System.out.print(nums[i]+" ");
    }
}
